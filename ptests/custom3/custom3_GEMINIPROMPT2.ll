; ModuleID = 'custom3_unoptimized.ll'
source_filename = "custom3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@0 = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@str = private unnamed_addr constant [17 x i8] c"Original Matrix:\00", align 1
@str.1 = private unnamed_addr constant [20 x i8] c"Manipulated Matrix:\00", align 1

; Function Attrs: noinline nounwind uwtable
define internal void @printMatrix(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %codeRepl

codeRepl:                                         ; preds = %codeRepl, %1
  call void @printMatrix.extracted(ptr %4, ptr %2, ptr %3)
  %putchar2 = tail call i32 @putchar(i32 10)
  %5 = load i32, ptr %3, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, ptr %3, align 4
  %7 = icmp slt i32 %6, 5
  br i1 %7, label %codeRepl, label %8, !llvm.loop !6

8:                                                ; preds = %codeRepl
  %putchar = tail call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @manipulateMatrix(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %codeRepl

codeRepl:                                         ; preds = %codeRepl, %1
  call void @manipulateMatrix.extracted(ptr %4, ptr %5, ptr %2, ptr %3, ptr %6, ptr %7, ptr %8)
  %9 = load i32, ptr %3, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %3, align 4
  %11 = icmp slt i32 %10, 5
  br i1 %11, label %codeRepl, label %12, !llvm.loop !8

12:                                               ; preds = %codeRepl
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, ptr %2, align 4
  br label %codeRepl

codeRepl:                                         ; preds = %codeRepl, %0
  call void @main.extracted(ptr %3, ptr %2, ptr %1)
  %4 = load i32, ptr %2, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, ptr %2, align 4
  %6 = icmp slt i32 %5, 5
  br i1 %6, label %codeRepl, label %7, !llvm.loop !9

7:                                                ; preds = %codeRepl
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @printMatrix(ptr noundef nonnull %1)
  call void @manipulateMatrix(ptr noundef nonnull %1)
  %puts1 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @printMatrix(ptr noundef nonnull %1)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #3

; Function Attrs: noinline nounwind uwtable
define internal void @printMatrix.extracted(ptr %0, ptr %1, ptr %2) #0 {
newFuncRoot:
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, ptr %0, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %newFuncRoot
  %.reg2mem3.0 = phi i32 [ 0, %newFuncRoot ], [ %11, %._crit_edge ]
  %3 = load ptr, ptr %1, align 8
  %4 = load i32, ptr %2, align 4
  %5 = sext i32 %4 to i64
  %6 = sext i32 %.reg2mem3.0 to i64
  %7 = getelementptr inbounds [5 x i32], ptr %3, i64 %5, i64 %6
  %8 = load i32, ptr %7, align 4
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, i32 noundef %8) #4
  %10 = load i32, ptr %0, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %0, align 4
  %12 = icmp slt i32 %11, 5
  br i1 %12, label %._crit_edge, label %.exitStub, !llvm.loop !10

.exitStub:                                        ; preds = %._crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @manipulateMatrix.extracted(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6) #0 {
newFuncRoot:
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, ptr %0, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %newFuncRoot
  store i32 0, ptr %1, align 4
  br label %._crit_edge1

7:                                                ; preds = %19
  %8 = load i32, ptr %0, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, ptr %0, align 4
  %10 = icmp slt i32 %9, 5
  br i1 %10, label %._crit_edge, label %.exitStub, !llvm.loop !11

._crit_edge1:                                     ; preds = %19, %._crit_edge
  %.reg2mem29.0 = phi i32 [ 0, %._crit_edge ], [ %21, %19 ]
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %3, align 4
  %13 = sext i32 %12 to i64
  %14 = load i32, ptr %0, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [5 x i32], ptr %11, i64 %13, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = add nsw i32 %17, %.reg2mem29.0
  store i32 %18, ptr %16, align 4
  store i32 0, ptr %4, align 4
  br label %._crit_edge2

19:                                               ; preds = %32
  %20 = load i32, ptr %1, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %1, align 4
  %22 = icmp slt i32 %21, 5
  br i1 %22, label %._crit_edge1, label %7, !llvm.loop !12

._crit_edge2:                                     ; preds = %32, %._crit_edge1
  %.reg2mem27.0 = phi i32 [ 0, %._crit_edge1 ], [ %34, %32 ]
  %23 = add nsw i32 %.reg2mem27.0, 1
  %24 = load ptr, ptr %2, align 8
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = load i32, ptr %0, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [5 x i32], ptr %24, i64 %26, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = mul nsw i32 %30, %23
  store i32 %31, ptr %29, align 4
  store i32 0, ptr %5, align 4
  br label %._crit_edge3

32:                                               ; preds = %46
  %33 = load i32, ptr %4, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %4, align 4
  %35 = icmp slt i32 %34, 5
  br i1 %35, label %._crit_edge2, label %19, !llvm.loop !13

._crit_edge3:                                     ; preds = %46, %._crit_edge2
  %.reg2mem25.0 = phi i32 [ 0, %._crit_edge2 ], [ %48, %46 ]
  %36 = load i32, ptr %3, align 4
  %37 = load i32, ptr %0, align 4
  %38 = add nsw i32 %37, %36
  %39 = mul nsw i32 %38, %.reg2mem25.0
  %40 = load ptr, ptr %2, align 8
  %41 = sext i32 %36 to i64
  %42 = sext i32 %37 to i64
  %43 = getelementptr inbounds [5 x i32], ptr %40, i64 %41, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = sub nsw i32 %44, %39
  store i32 %45, ptr %43, align 4
  store i32 0, ptr %6, align 4
  br label %._crit_edge4

46:                                               ; preds = %70
  %47 = load i32, ptr %5, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %5, align 4
  %49 = icmp slt i32 %48, 5
  br i1 %49, label %._crit_edge3, label %32, !llvm.loop !14

._crit_edge4:                                     ; preds = %70, %._crit_edge3
  %.reg2mem23.0 = phi i32 [ 0, %._crit_edge3 ], [ %72, %70 ]
  %50 = and i32 %.reg2mem23.0, 1
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %61, label %52

52:                                               ; preds = %._crit_edge4
  %53 = load ptr, ptr %2, align 8
  %54 = load i32, ptr %3, align 4
  %55 = sext i32 %54 to i64
  %56 = load i32, ptr %0, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [5 x i32], ptr %53, i64 %55, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = sub nsw i32 %59, %.reg2mem23.0
  store i32 %60, ptr %58, align 4
  br label %70

61:                                               ; preds = %._crit_edge4
  %62 = load ptr, ptr %2, align 8
  %63 = load i32, ptr %3, align 4
  %64 = sext i32 %63 to i64
  %65 = load i32, ptr %0, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [5 x i32], ptr %62, i64 %64, i64 %66
  %68 = load i32, ptr %67, align 4
  %69 = add nsw i32 %68, %.reg2mem23.0
  store i32 %69, ptr %67, align 4
  br label %70

70:                                               ; preds = %52, %61
  %71 = load i32, ptr %6, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %6, align 4
  %73 = icmp slt i32 %72, 5
  br i1 %73, label %._crit_edge4, label %46, !llvm.loop !15

.exitStub:                                        ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @main.extracted(ptr %0, ptr %1, ptr %2) #0 {
newFuncRoot:
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, ptr %0, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %newFuncRoot
  %3 = tail call i32 @rand() #4
  %4 = srem i32 %3, 10
  %5 = load i32, ptr %1, align 4
  %6 = sext i32 %5 to i64
  %7 = load i32, ptr %0, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [5 x [5 x i32]], ptr %2, i64 0, i64 %6, i64 %8
  store i32 %4, ptr %9, align 4
  %10 = load i32, ptr %0, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %0, align 4
  %12 = icmp slt i32 %11, 5
  br i1 %12, label %._crit_edge, label %.exitStub, !llvm.loop !16

.exitStub:                                        ; preds = %._crit_edge
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

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
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
