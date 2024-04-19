; ModuleID = 'hw2perf_unoptimized.ll'
source_filename = "hw2perf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000 x i64], align 16
  %2 = alloca [1000 x i64], align 16
  %3 = alloca [1000 x i64], align 16
  %4 = alloca [1000 x i64], align 16
  br label %5

5:                                                ; preds = %6, %0
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next.1, %6 ]
  %exitcond.not = icmp eq i64 %indvars.iv, 1000
  br i1 %exitcond.not, label %19, label %6

6:                                                ; preds = %5
  %7 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %indvars.iv
  store i64 %indvars.iv, ptr %7, align 16
  %8 = shl nuw nsw i64 %indvars.iv, 1
  %9 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %indvars.iv
  store i64 %8, ptr %9, align 16
  %10 = mul nuw nsw i64 %indvars.iv, 3
  %11 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %indvars.iv
  store i64 %10, ptr %11, align 16
  %12 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %indvars.iv
  store i64 0, ptr %12, align 16
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %indvars.iv.next
  store i64 %indvars.iv.next, ptr %13, align 8
  %14 = shl nuw nsw i64 %indvars.iv.next, 1
  %15 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %indvars.iv.next
  store i64 %14, ptr %15, align 8
  %16 = mul nuw nsw i64 %indvars.iv.next, 3
  %17 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %indvars.iv.next
  store i64 %16, ptr %17, align 8
  %18 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %indvars.iv.next
  store i64 0, ptr %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  br label %5, !llvm.loop !6

19:                                               ; preds = %5
  call void @srand(i32 noundef 4) #3
  br label %20

20:                                               ; preds = %87, %19
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %87 ], [ 0, %19 ]
  %.07 = phi i32 [ %.29, %87 ], [ 15, %19 ]
  %.04 = phi i32 [ %.26, %87 ], [ 5, %19 ]
  %.0 = phi i32 [ %.3, %87 ], [ 0, %19 ]
  %exitcond20.not = icmp eq i64 %indvars.iv17, 1000000000
  br i1 %exitcond20.not, label %88, label %21

21:                                               ; preds = %20
  %22 = sext i32 %.04 to i64
  %23 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %22
  %24 = load i64, ptr %23, align 8
  %25 = mul i64 %24, 87
  %26 = sdiv i64 %25, 4
  %27 = add nsw i64 %26, 23
  %28 = zext i32 %.07 to i64
  %29 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %28
  %30 = load i64, ptr %29, align 8
  %31 = mul i64 %30, 231
  %32 = sdiv i64 %31, 3
  %33 = add nsw i64 %32, 59
  %34 = add nsw i64 %33, %27
  %35 = srem i64 %34, 1000
  %36 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %35
  %37 = load i64, ptr %36, align 8
  %38 = add nsw i64 %24, %37
  %39 = add nsw i64 %38, %30
  %40 = mul nsw i64 %27, 11
  %41 = mul nsw i64 %33, 13
  %42 = mul nsw i64 %39, 17
  %43 = add i64 %40, %indvars.iv17
  %44 = add i64 %43, %41
  %45 = add i64 %44, %42
  %46 = trunc i64 %indvars.iv17 to i32
  %.urem16 = urem i32 %46, 1000
  %47 = zext i32 %.urem16 to i64
  %48 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %47
  store i64 %45, ptr %48, align 8
  %49 = icmp ult i64 %indvars.iv17, 100
  br i1 %49, label %50, label %87

50:                                               ; preds = %21, %51
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %51 ], [ 0, %21 ]
  %.1 = phi i32 [ %spec.select, %51 ], [ %.0, %21 ]
  %exitcond15.not = icmp eq i64 %indvars.iv12, 1000000
  br i1 %exitcond15.not, label %82, label %51

51:                                               ; preds = %50
  %52 = zext i32 %.1 to i64
  %53 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %52
  %54 = load i64, ptr %53, align 8
  %55 = mul nsw i64 %54, 6
  %56 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %52
  %57 = load i64, ptr %56, align 8
  %58 = sdiv i64 %57, 2
  %59 = add nsw i64 %58, %55
  %60 = srem i64 %59, 1000
  %61 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %60
  %62 = load i64, ptr %61, align 8
  %63 = shl nsw i64 %62, 1
  %64 = shl nsw i64 %54, 2
  %65 = add nsw i64 %64, %63
  %66 = srem i64 %65, 1000
  %67 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %66
  %68 = load i64, ptr %67, align 16
  %69 = mul nsw i64 %68, 6
  %70 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %52
  %71 = load i64, ptr %70, align 8
  %72 = mul nsw i64 %71, 3
  %73 = add nsw i64 %72, %69
  %74 = mul nsw i64 %73, 2
  %75 = add i64 %59, %indvars.iv12
  %76 = add i64 %75, %65
  %77 = add i64 %76, %74
  %78 = trunc i64 %indvars.iv12 to i32
  %.urem = urem i32 %78, 100
  %79 = zext i32 %.urem to i64
  %80 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %79
  store i64 %77, ptr %80, align 8
  %81 = icmp ult i64 %indvars.iv12, 10
  %spec.select = select i1 %81, i32 59, i32 %.1
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  br label %50, !llvm.loop !8

82:                                               ; preds = %50
  %83 = icmp eq i64 %indvars.iv17, 0
  br i1 %83, label %84, label %87

84:                                               ; preds = %82
  %85 = call i32 @rand() #3
  %86 = srem i32 %85, 1000
  br label %87

87:                                               ; preds = %21, %82, %84
  %.29 = phi i32 [ %.07, %21 ], [ %.07, %84 ], [ 37, %82 ]
  %.26 = phi i32 [ %.04, %21 ], [ %86, %84 ], [ %.04, %82 ]
  %.3 = phi i32 [ %.0, %21 ], [ %.1, %84 ], [ %.1, %82 ]
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  br label %20, !llvm.loop !9

88:                                               ; preds = %20, %89
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %89 ], [ 0, %20 ]
  %exitcond24.not = icmp eq i64 %indvars.iv21, 1000
  br i1 %exitcond24.not, label %93, label %89

89:                                               ; preds = %88
  %90 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %indvars.iv21
  %91 = load i64, ptr %90, align 8
  %92 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %91) #3
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  br label %88, !llvm.loop !10

93:                                               ; preds = %88
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
