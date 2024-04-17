; ModuleID = 'custom3_unoptimized.ll'
source_filename = "custom3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@str = private unnamed_addr constant [17 x i8] c"Original Matrix:\00", align 1
@str.1 = private unnamed_addr constant [20 x i8] c"Manipulated Matrix:\00", align 1

; Function Attrs: nofree noinline nounwind uwtable
define dso_local void @printMatrix(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = load i32, ptr %0, align 4
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %2)
  %4 = getelementptr inbounds [5 x i32], ptr %0, i64 0, i64 1
  %5 = load i32, ptr %4, align 4
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %5)
  %7 = getelementptr inbounds [5 x i32], ptr %0, i64 0, i64 2
  %8 = load i32, ptr %7, align 4
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %8)
  %10 = getelementptr inbounds [5 x i32], ptr %0, i64 0, i64 3
  %11 = load i32, ptr %10, align 4
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %11)
  %13 = getelementptr inbounds [5 x i32], ptr %0, i64 0, i64 4
  %14 = load i32, ptr %13, align 4
  %15 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %14)
  %putchar7 = tail call i32 @putchar(i32 10)
  %16 = getelementptr inbounds [5 x i32], ptr %0, i64 1, i64 0
  %17 = load i32, ptr %16, align 4
  %18 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %17)
  %19 = getelementptr inbounds [5 x i32], ptr %0, i64 1, i64 1
  %20 = load i32, ptr %19, align 4
  %21 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %20)
  %22 = getelementptr inbounds [5 x i32], ptr %0, i64 1, i64 2
  %23 = load i32, ptr %22, align 4
  %24 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %23)
  %25 = getelementptr inbounds [5 x i32], ptr %0, i64 1, i64 3
  %26 = load i32, ptr %25, align 4
  %27 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %26)
  %28 = getelementptr inbounds [5 x i32], ptr %0, i64 1, i64 4
  %29 = load i32, ptr %28, align 4
  %30 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %29)
  %putchar7.1 = tail call i32 @putchar(i32 10)
  %31 = getelementptr inbounds [5 x i32], ptr %0, i64 2, i64 0
  %32 = load i32, ptr %31, align 4
  %33 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %32)
  %34 = getelementptr inbounds [5 x i32], ptr %0, i64 2, i64 1
  %35 = load i32, ptr %34, align 4
  %36 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %35)
  %37 = getelementptr inbounds [5 x i32], ptr %0, i64 2, i64 2
  %38 = load i32, ptr %37, align 4
  %39 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %38)
  %40 = getelementptr inbounds [5 x i32], ptr %0, i64 2, i64 3
  %41 = load i32, ptr %40, align 4
  %42 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %41)
  %43 = getelementptr inbounds [5 x i32], ptr %0, i64 2, i64 4
  %44 = load i32, ptr %43, align 4
  %45 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %44)
  %putchar7.2 = tail call i32 @putchar(i32 10)
  %46 = getelementptr inbounds [5 x i32], ptr %0, i64 3, i64 0
  %47 = load i32, ptr %46, align 4
  %48 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %47)
  %49 = getelementptr inbounds [5 x i32], ptr %0, i64 3, i64 1
  %50 = load i32, ptr %49, align 4
  %51 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %50)
  %52 = getelementptr inbounds [5 x i32], ptr %0, i64 3, i64 2
  %53 = load i32, ptr %52, align 4
  %54 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %53)
  %55 = getelementptr inbounds [5 x i32], ptr %0, i64 3, i64 3
  %56 = load i32, ptr %55, align 4
  %57 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %56)
  %58 = getelementptr inbounds [5 x i32], ptr %0, i64 3, i64 4
  %59 = load i32, ptr %58, align 4
  %60 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %59)
  %putchar7.3 = tail call i32 @putchar(i32 10)
  %61 = getelementptr inbounds [5 x i32], ptr %0, i64 4, i64 0
  %62 = load i32, ptr %61, align 4
  %63 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %62)
  %64 = getelementptr inbounds [5 x i32], ptr %0, i64 4, i64 1
  %65 = load i32, ptr %64, align 4
  %66 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %65)
  %67 = getelementptr inbounds [5 x i32], ptr %0, i64 4, i64 2
  %68 = load i32, ptr %67, align 4
  %69 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %68)
  %70 = getelementptr inbounds [5 x i32], ptr %0, i64 4, i64 3
  %71 = load i32, ptr %70, align 4
  %72 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %71)
  %73 = getelementptr inbounds [5 x i32], ptr %0, i64 4, i64 4
  %74 = load i32, ptr %73, align 4
  %75 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %74)
  %putchar7.4 = tail call i32 @putchar(i32 10)
  %putchar = tail call i32 @putchar(i32 10)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @manipulateMatrix(ptr nocapture noundef %0) local_unnamed_addr #2 {
  br label %2

2:                                                ; preds = %36, %1
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %36 ], [ 0, %1 ]
  %exitcond53.not = icmp eq i64 %indvars.iv50, 5
  br i1 %exitcond53.not, label %37, label %.preheader39

.preheader39:                                     ; preds = %2, %35
  %indvars.iv = phi i64 [ %indvars.iv.next, %35 ], [ 0, %2 ]
  %exitcond49.not = icmp eq i64 %indvars.iv, 5
  br i1 %exitcond49.not, label %36, label %.preheader

.preheader:                                       ; preds = %.preheader39
  %3 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv50, i64 %indvars.iv
  %4 = add nuw nsw i64 %indvars.iv, %indvars.iv50
  %.promoted44 = load i32, ptr %3, align 4
  %5 = trunc i64 %4 to i32
  %.neg = mul i32 %5, -3
  %.tr = trunc i64 %4 to i32
  %6 = shl i32 %.tr, 1
  %7 = trunc i64 %4 to i32
  %8 = add i32 %6, %7
  %.tr54 = trunc i64 %4 to i32
  %9 = shl i32 %.tr54, 2
  br label %10

10:                                               ; preds = %.preheader, %.loopexit
  %storemerge40.lcssa42.lcssa43.lcssa45 = phi i32 [ %storemerge.4.4.4, %.loopexit ], [ %.promoted44, %.preheader ]
  %.036 = phi i32 [ %34, %.loopexit ], [ 0, %.preheader ]
  %exitcond47.not = icmp eq i32 %.036, 5
  br i1 %exitcond47.not, label %35, label %.loopexit

.loopexit:                                        ; preds = %10
  %11 = add nsw i32 %storemerge40.lcssa42.lcssa43.lcssa45, %.036
  %12 = add i32 %11, 4
  %13 = sub i32 %12, %8
  %storemerge.4.2 = add i32 %13, 2
  %14 = add i32 %.neg, %storemerge.4.2
  %storemerge.4.3 = add i32 %14, 2
  %15 = sub nsw i32 %storemerge.4.3, %9
  %storemerge.4.4 = shl i32 %15, 1
  %16 = add i32 %storemerge.4.4, 8
  %17 = sub i32 %16, %8
  %storemerge.4.2.1 = add i32 %17, 2
  %18 = add i32 %.neg, %storemerge.4.2.1
  %storemerge.4.3.1 = add i32 %18, 2
  %19 = sub nsw i32 %storemerge.4.3.1, %9
  %20 = mul i32 %19, 3
  %21 = add i32 %20, 10
  %22 = sub i32 %21, %8
  %storemerge.4.2.2 = add i32 %22, 2
  %23 = add i32 %.neg, %storemerge.4.2.2
  %storemerge.4.3.2 = add i32 %23, 2
  %24 = sub nsw i32 %storemerge.4.3.2, %9
  %storemerge.4.4.2 = shl i32 %24, 2
  %25 = add i32 %storemerge.4.4.2, 12
  %26 = sub i32 %25, %8
  %storemerge.4.2.3 = add i32 %26, 2
  %27 = add i32 %.neg, %storemerge.4.2.3
  %storemerge.4.3.3 = add i32 %27, 2
  %28 = sub nsw i32 %storemerge.4.3.3, %9
  %29 = mul i32 %28, 5
  %30 = add i32 %29, 14
  %31 = sub i32 %30, %8
  %storemerge.4.2.4 = add i32 %31, 2
  %32 = add i32 %.neg, %storemerge.4.2.4
  %storemerge.4.3.4 = add i32 %32, 2
  %33 = sub nsw i32 %storemerge.4.3.4, %9
  %storemerge.4.4.4 = add i32 %33, 2
  %34 = add nuw nsw i32 %.036, 1
  br label %10, !llvm.loop !6

35:                                               ; preds = %10
  store i32 %storemerge40.lcssa42.lcssa43.lcssa45, ptr %3, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %.preheader39, !llvm.loop !8

36:                                               ; preds = %.preheader39
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  br label %2, !llvm.loop !9

37:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #3 {
  %1 = alloca [5 x [5 x i32]], align 16
  br label %2

2:                                                ; preds = %3, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %3 ], [ 0, %0 ]
  %exitcond.not = icmp eq i64 %indvars.iv, 5
  br i1 %exitcond.not, label %19, label %3

3:                                                ; preds = %2
  %4 = tail call i32 @rand() #6
  %5 = srem i32 %4, 10
  %6 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv, i64 0
  store i32 %5, ptr %6, align 4
  %7 = tail call i32 @rand() #6
  %8 = srem i32 %7, 10
  %9 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv, i64 1
  store i32 %8, ptr %9, align 4
  %10 = tail call i32 @rand() #6
  %11 = srem i32 %10, 10
  %12 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv, i64 2
  store i32 %11, ptr %12, align 4
  %13 = tail call i32 @rand() #6
  %14 = srem i32 %13, 10
  %15 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv, i64 3
  store i32 %14, ptr %15, align 4
  %16 = tail call i32 @rand() #6
  %17 = srem i32 %16, 10
  %18 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv, i64 4
  store i32 %17, ptr %18, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %2, !llvm.loop !10

19:                                               ; preds = %2
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @printMatrix(ptr noundef nonnull %1)
  call void @manipulateMatrix(ptr noundef nonnull %1)
  %puts7 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @printMatrix(ptr noundef nonnull %1)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #5

attributes #0 = { nofree noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind }
attributes #6 = { nounwind }

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
